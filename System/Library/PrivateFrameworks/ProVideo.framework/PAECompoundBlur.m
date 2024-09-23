@implementation PAECompoundBlur

- (PAECompoundBlur)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAECompoundBlur;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  if (-[PAECompoundBlur properties]::once != -1)
    dispatch_once(&-[PAECompoundBlur properties]::once, &__block_literal_global_23);
  return (id)-[PAECompoundBlur properties]::sPropertiesDict;
}

uint64_t __29__PAECompoundBlur_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, CFSTR("PositionIndependent"), v2, CFSTR("MayRemapTime"), v3, CFSTR("SupportsLargeRenderScale"), v4, CFSTR("SupportsHeliumRendering"), v5, CFSTR("InputSizeLimit"), v6, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
  -[PAECompoundBlur properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PAECompoundBlur;
  -[PAESharedDefaultBase addParameters](&v7, sel_addParameters);
  v3 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CompoundBlur::Amount"), 0, 0), 1, 0, 7.0, 0.0, 300.0, 0.0, 32.0, 1.0);
    objc_msgSend(v4, "addImageReferenceWithName:parmId:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CompoundBlur::Blur Map"), 0, 0), 2, 0);
    objc_msgSend(v4, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CompoundBlur::Map Channel"), 0, 0), 3, 4, objc_msgSend((id)objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CompoundBlur::ChannelEntries"), 0, 0), "componentsSeparatedByString:", CFSTR("|")), 1);
    objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CompoundBlur::Invert Map"), 0, 0), 4, 0, 33);
    objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CompoundBlur::Stretch Map"), 0, 0), 5, 0, 33);
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CompoundBlur::Horizontal"), 0, 0), 6, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CompoundBlur::Vertical"), 0, 0), 7, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
  }
  return 1;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  void *v12;
  BOOL v13;
  BOOL v14;
  char v15;
  void *v16;
  int64x2_t v17;
  float64x2_t v18;
  float v19;
  int32x2_t v20;
  char v21;
  double v22;
  double v23;
  double v24;

  if (-[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a6->var0.var1))
  {
    *a3 = a5->var0;
    *a4 = a5->var1;
    return 1;
  }
  else
  {
    v12 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4590);
    if (a3)
      v13 = v12 == 0;
    else
      v13 = 1;
    v14 = v13 || a4 == 0;
    v15 = v14;
    if (!v14)
    {
      v16 = v12;
      v24 = 0.0;
      objc_msgSend(v12, "getFloatValue:fromParm:atFxTime:", &v24, 1, a6->var0.var1);
      v23 = 0.0;
      objc_msgSend(v16, "getFloatValue:fromParm:atFxTime:", &v23, 6, a6->var0.var1);
      v23 = v23 * 0.01;
      v22 = 0.0;
      objc_msgSend(v16, "getFloatValue:fromParm:atFxTime:", &v22, 7, a6->var0.var1);
      v22 = v22 * 0.01;
      v21 = 0;
      objc_msgSend(v16, "getBoolValue:fromParm:atFxTime:", &v21, 5, a6->var0.var1);
      v17 = *(int64x2_t *)&a5->var0;
      if (!v21)
      {
        v18.f64[0] = v23;
        v19 = v24 + v24;
        v18.f64[1] = v22;
        v20 = vmovn_s64(vcvtq_s64_f64(vrndpq_f64(vmulq_n_f64(v18, v19))));
        v17 = vaddw_s32(v17, vadd_s32(v20, v20));
      }
      *a3 = v17.i64[0];
      *a4 = v17.u64[1];
    }
    return v15 ^ 1;
  }
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  int v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  int v15;
  uint64_t v16;
  __int128 v17;
  int v18;
  float v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint64_t v26;
  HGModulatedBlur *v27;
  float v28;
  float v29;
  float v30;
  float v31;
  HGColorMatrix *v32;
  float32x4_t v33;
  float32x4_t v34;
  __int128 v36;
  uint64_t v37;
  float32x2_t v38;
  HGColorMatrix *v39;
  _OWORD v40[3];
  id v41;
  uint64_t v42;
  unsigned __int8 v43;
  char v44;
  int v45;
  double v46;
  double v47;
  long double __x;
  double v49;
  double v50;
  float32x4_t v51[4];
  __int128 v52;
  _OWORD v53[2];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4590);
  if (v10)
  {
    v11 = (void *)v10;
    -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4);
    v13 = v49;
    v12 = v50;
    if (v49 <= v50)
      v14 = v50;
    else
      v14 = v49;
    __x = 0.0;
    objc_msgSend(v11, "getFloatValue:fromParm:atFxTime:", &__x, 1, a5->var0.var1);
    __x = __x * 0.5;
    v47 = 0.0;
    objc_msgSend(v11, "getFloatValue:fromParm:atFxTime:", &v47, 6, a5->var0.var1);
    v47 = v13 / v14 * (v47 * 0.01);
    v46 = 0.0;
    objc_msgSend(v11, "getFloatValue:fromParm:atFxTime:", &v46, 7, a5->var0.var1);
    v46 = v12 / v14 * (v46 * 0.01);
    v45 = 0;
    objc_msgSend(v11, "getIntValue:fromParm:atFxTime:", &v45, 3, a5->var0.var1);
    v44 = 0;
    objc_msgSend(v11, "getBoolValue:fromParm:atFxTime:", &v44, 4, a5->var0.var1);
    v43 = 0;
    objc_msgSend(v11, "getBoolValue:fromParm:atFxTime:", &v43, 5, a5->var0.var1);
    v15 = objc_msgSend(a4, "imageType");
    if (__x <= 0.0)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef", (double)__x);
      else
        v51[0].i64[0] = 0;
      objc_msgSend(a3, "setHeliumRef:", v51);
      if (v51[0].i64[0])
        (*(void (**)(uint64_t))(*(_QWORD *)v51[0].i64[0] + 24))(v51[0].i64[0]);
      goto LABEL_46;
    }
    v18 = v15;
    v19 = -1.0;
    if (!v44)
      v19 = 1.0;
    v38 = (float32x2_t)LODWORD(v19);
    switch(v45)
    {
      case 1:
        *(_QWORD *)&v17 = 0;
        v36 = v17;
        *((float *)&v17 + 1) = v19;
        v38 = (float32x2_t)v17;
        objc_msgSend(a4, "pixelAspect", v36);
        break;
      case 2:
        v38 = 0;
        objc_msgSend(a4, "pixelAspect", LODWORD(v19), *((_QWORD *)&v17 + 1));
        break;
      case 3:
        LODWORD(v17) = 0;
        v38 = 0;
        *((float *)&v17 + 1) = v19;
        goto LABEL_19;
      case 4:
        v38 = vmul_n_f32((float32x2_t)0x3F1C01A33E9E00D2, v19);
        DWORD1(v17) = 0;
        *(float *)&v17 = v19 * 0.082;
LABEL_19:
        objc_msgSend(a4, "pixelAspect", v17);
        break;
      default:
        objc_msgSend(a4, "pixelAspect", 0, v16);
        break;
    }
    v21 = v20;
    LOBYTE(v10) = 0;
    if (self->super.super._upscalesFields)
      v22 = 1.0;
    else
      v22 = 2.0;
    if (v9 && v18 == 3)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef");
      else
        v42 = 0;
      v41 = 0;
      v23 = *(_OWORD *)&a5->var2;
      v24 = *(_OWORD *)&a5->var4;
      v40[0] = *(_OWORD *)&a5->var0.var0;
      v40[1] = v23;
      v40[2] = v24;
      -[PAESharedDefaultBase getHeliumImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:](self, "getHeliumImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:", &v41, 0, 0, v40, 2, a5->var0.var1);
      v25 = v41;
      if (v41)
      {
        objc_msgSend(v41, "heliumRef");
        v26 = v51[0].i64[0];
      }
      else
      {
        v41 = a4;
        v26 = v42;
        if (v42)
          (*(void (**)(uint64_t))(*(_QWORD *)v42 + 16))(v42);
      }
      v27 = (HGModulatedBlur *)HGObject::operator new(0x1D0uLL);
      HGModulatedBlur::HGModulatedBlur(v27);
      v28 = __x;
      (*(void (**)(HGModulatedBlur *, _QWORD, float, float, float, float))(*(_QWORD *)v27 + 96))(v27, 0, v28, 0.0, 0.0, 0.0);
      v29 = v13 * v47 / v21;
      v30 = v12 * v46 / v22;
      (*(void (**)(HGModulatedBlur *, uint64_t, float, float, float, float))(*(_QWORD *)v27 + 96))(v27, 1, v29, v30, 0.0, 0.0);
      v52 = xmmword_1B30500C0;
      v53[0] = unk_1B30500D0;
      *(_OWORD *)((char *)v53 + 12) = unk_1B30500DC;
      v31 = ceil(log2(__x)) + 1.0;
      if (v31 <= 0.0)
        v31 = 1.0;
      HGModulatedBlur::setBlurValues(v27, (const float *)&v52, (unint64_t)v31);
      (*(void (**)(HGModulatedBlur *, _QWORD, uint64_t))(*(_QWORD *)v27 + 120))(v27, 0, v42);
      v32 = (HGColorMatrix *)HGObject::operator new(0x1F0uLL);
      HGColorMatrix::HGColorMatrix(v32);
      (*(void (**)(HGColorMatrix *, _QWORD, uint64_t))(*(_QWORD *)v32 + 120))(v32, 0, v26);
      *(float32x2_t *)v33.f32 = v38;
      v33.i64[1] = v37;
      v51[0] = v33;
      memset(&v51[1], 0, 32);
      v51[3] = (float32x4_t)xmmword_1B304EFF0;
      v34 = HGColorMatrix::MultMatrix((float32x4_t *)v32, v51, 1);
      if (v44)
        v34 = HGColorMatrix::Translate((float32x4_t *)v32, 1.0, 0.0, 0.0);
      v39 = v32;
      (*(void (**)(HGColorMatrix *, float32x4_t))(*(_QWORD *)v32 + 16))(v32, v34);
      -[PAESharedDefaultBase transform:fromImage:toImage:fit:](self, "transform:fromImage:toImage:fit:", &v39, v41, a4, v43);
      (*(void (**)(HGModulatedBlur *, uint64_t, HGColorMatrix *))(*(_QWORD *)v27 + 120))(v27, 1, v39);
      if (v39)
        (*(void (**)(HGColorMatrix *))(*(_QWORD *)v39 + 24))(v39);
      (*(void (**)(HGColorMatrix *))(*(_QWORD *)v32 + 24))(v32);
      v51[0].i64[0] = (uint64_t)v27;
      (*(void (**)(HGModulatedBlur *))(*(_QWORD *)v27 + 16))(v27);
      objc_msgSend(a3, "setHeliumRef:", v51);
      if (v51[0].i64[0])
        (*(void (**)(uint64_t))(*(_QWORD *)v51[0].i64[0] + 24))(v51[0].i64[0]);
      if (v25)

      (*(void (**)(HGModulatedBlur *))(*(_QWORD *)v27 + 24))(v27);
      if (v26)
        (*(void (**)(uint64_t))(*(_QWORD *)v26 + 24))(v26);
      if (v42)
        (*(void (**)(uint64_t))(*(_QWORD *)v42 + 24))(v42);
LABEL_46:
      LOBYTE(v10) = 1;
    }
  }
  return v10;
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
