@implementation PAESharpen

- (PAESharpen)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAESharpen;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("SupportsHeliumRendering"), v5, CFSTR("MayRemapTime"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  id v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  uint64_t v11;
  id result;
  objc_class *v13;
  id v14;
  char v15;
  double v16;

  v7 = -[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4);
  v16 = 0.0;
  if ((objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v16, 2, a3.var1) & 1) != 0)
  {
    if (v16 == 0.0)
      v8 = 6;
    else
      v8 = 1;
    v15 = 0;
    objc_msgSend(v7, "getBoolValue:fromParm:atFxTime:", &v15, 3, a3.var1, v16);
    v9 = v15 == 0;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    return (id)objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9), CFSTR("SupportsLargeRenderScale"), 0);
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
  v6.super_class = (Class)PAESharpen;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A6DD0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Sharpen::Intensity"), 0, 0), 1, 0, 1.0, 0.0, 2.0, 0.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Sharpen::Amount"), 0, 0), 2, 0, 2.5, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Sharpen::Equirect"), 0, 0), 3, 0, 1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Sharpen::Amount"), 0, 0), 4, 0, 2);
  }
  return v3 != 0;
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  int v14;
  double v15;
  double v16;
  HGNode *v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  double v22;
  unint64_t v23;
  float v24;
  float v25;
  float v26;
  float64_t v27;
  float v28;
  float v29;
  float v30;
  HgcSharpen *v31;
  float v32;
  char *v33;
  float64_t v34;
  HGCrop *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float64_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  _OWORD v48[9];
  float64x2_t v49[2];
  float64x2_t v50;
  float64x2_t v51;
  float64_t v52;
  char v53;
  double v54;
  double v55;
  double v56;
  double v57;

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
  v57 = 2.5;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v57, 2, a5->var0.var1);
  if (v57 == 0.0)
  {
    if (a4)
      objc_msgSend(a4, "heliumRef", v57);
    else
      v49[0].f64[0] = 0.0;
    objc_msgSend(a3, "setHeliumRef:", v49);
    if (*(_QWORD *)&v49[0].f64[0])
      (*(void (**)(_QWORD))(**(_QWORD **)&v49[0].f64[0] + 24))(*(_QWORD *)&v49[0].f64[0]);
  }
  else
  {
    v14 = objc_msgSend(v12, "versionAtCreation", v57);
    -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4);
    v15 = v55;
    v16 = v56;
    v54 = 1.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v54, 1, a5->var0.var1);
    v53 = 0;
    objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v53, 3, a5->var0.var1);
    if (a4)
      objc_msgSend(a4, "heliumRef");
    else
      v52 = 0.0;
    if (v53)
    {
      -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
      -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a3);
      v17 = (HGNode *)HGObject::operator new(0x1C0uLL);
      HGNode::HGNode(v17);
      *(_QWORD *)v17 = off_1E64E3B98;
      *((_QWORD *)v17 + 51) = 0;
      *((_QWORD *)v17 + 52) = 0;
      *((_DWORD *)v17 + 106) = 0;
      *((_QWORD *)v17 + 54) = 0;
      *((_QWORD *)v17 + 55) = 0;
      (*(void (**)(HGNode *, _QWORD, uint64_t))(*(_QWORD *)v17 + 120))(v17, 0, objc_msgSend(a4, "heliumNode"));
      v19 = v56;
      v18 = v57;
      v20 = v55;
      v21 = objc_msgSend(a4, "width");
      v22 = v49[0].f64[0];
      v23 = objc_msgSend(a4, "height");
      v24 = v18;
      v25 = v20;
      v26 = v19;
      v48[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v49[0]), v49[1]);
      v47 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v50), v51);
      v46 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)v48[1]), (float64x2_t)v48[2]);
      v45 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)v48[3]), (float64x2_t)v48[4]);
      HEquirectGaussianBlur::init((uint64_t)v17, vcvtpd_s64_f64(fabs(v22) * (double)v21), vcvtpd_s64_f64(fabs(v50.f64[1]) * (double)v23), (float32x2_t *)v48, (float32x2_t *)&v47, (float32x2_t *)&v46, (float32x2_t *)&v45, v24, v25, v26);
      (*(void (**)(HGNode *))(*(_QWORD *)v17 + 16))(v17);
      (*(void (**)(HGNode *))(*(_QWORD *)v17 + 24))(v17);
    }
    else
    {
      v44 = v52;
      if (v52 != 0.0)
        (*(void (**)(float64_t))(**(_QWORD **)&v52 + 16))(COERCE_FLOAT64_T(*(_QWORD *)&v52));
      -[PAESharedDefaultBase smear:fromImage:toImage:](self, "smear:fromImage:toImage:", &v44, a4, a4);
      v27 = v49[0].f64[0];
      if (*(_QWORD *)&v52 == *(_QWORD *)&v49[0].f64[0])
      {
        if (v52 != 0.0)
          (*(void (**)(float64_t))(**(_QWORD **)&v52 + 24))(COERCE_FLOAT64_T(*(_QWORD *)&v52));
      }
      else
      {
        if (v52 != 0.0)
        {
          (*(void (**)(float64_t))(**(_QWORD **)&v52 + 24))(COERCE_FLOAT64_T(*(_QWORD *)&v52));
          v27 = v49[0].f64[0];
        }
        v52 = v27;
        v49[0].f64[0] = 0.0;
      }
      if (v44 != 0.0)
        (*(void (**)(float64_t))(**(_QWORD **)&v44 + 24))(COERCE_FLOAT64_T(*(_QWORD *)&v44));
      v17 = (HGNode *)HGObject::operator new(0x1B0uLL);
      HGaussianBlur::HGaussianBlur((HGaussianBlur *)v17);
      v28 = v57;
      v29 = v15;
      v30 = v16;
      HGaussianBlur::init((HGaussianBlur *)v17, v28, v29, v30, v14 == 0, 0, 0);
      (*(void (**)(HGNode *, _QWORD, float64_t))(*(_QWORD *)v17 + 120))(v17, 0, COERCE_FLOAT64_T(*(_QWORD *)&v52));
      (*(void (**)(HGNode *))(*(_QWORD *)v17 + 16))(v17);
      (*(void (**)(HGNode *))(*(_QWORD *)v17 + 24))(v17);
    }
    v31 = (HgcSharpen *)HGObject::operator new(0x1A0uLL);
    HgcSharpen::HgcSharpen(v31);
    *(_QWORD *)v31 = &unk_1E64DBC80;
    v32 = v54;
    HgcSharpen::SetParameter(v31, 0, v32, v32, v32, v32, v33);
    if (a4)
    {
      objc_msgSend(a4, "heliumRef");
      v34 = v49[0].f64[0];
    }
    else
    {
      v34 = 0.0;
      v49[0].f64[0] = 0.0;
    }
    (*(void (**)(HgcSharpen *, _QWORD, float64_t))(*(_QWORD *)v31 + 120))(v31, 0, COERCE_FLOAT64_T(*(_QWORD *)&v34));
    if (*(_QWORD *)&v49[0].f64[0])
      (*(void (**)(_QWORD))(**(_QWORD **)&v49[0].f64[0] + 24))(*(_QWORD *)&v49[0].f64[0]);
    (*(void (**)(HgcSharpen *, uint64_t, HGNode *))(*(_QWORD *)v31 + 120))(v31, 1, v17);
    v35 = (HGCrop *)HGObject::operator new(0x1A0uLL);
    HGCrop::HGCrop(v35);
    (*(void (**)(HGCrop *, _QWORD, HgcSharpen *))(*(_QWORD *)v35 + 120))(v35, 0, v31);
    v36 = objc_msgSend(a3, "width");
    v37 = objc_msgSend(a3, "height");
    v38 = objc_msgSend(a3, "width");
    v39 = objc_msgSend(a3, "height");
    v40 = (double)v36 * -0.5;
    v41 = (double)v37 * -0.5;
    v42 = (double)v38 * 0.5;
    v43 = (double)v39 * 0.5;
    (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v35 + 96))(v35, 0, v40, v41, v42, v43);
    *(_QWORD *)&v49[0].f64[0] = v35;
    (*(void (**)(HGCrop *))(*(_QWORD *)v35 + 16))(v35);
    objc_msgSend(a3, "setHeliumRef:", v49);
    if (*(_QWORD *)&v49[0].f64[0])
      (*(void (**)(_QWORD))(**(_QWORD **)&v49[0].f64[0] + 24))(*(_QWORD *)&v49[0].f64[0]);
    (*(void (**)(HGCrop *))(*(_QWORD *)v35 + 24))(v35);
    (*(void (**)(HgcSharpen *))(*(_QWORD *)v31 + 24))(v31);
    (*(void (**)(HGNode *))(*(_QWORD *)v17 + 24))(v17);
    if (v52 != 0.0)
      (*(void (**)(float64_t))(**(_QWORD **)&v52 + 24))(COERCE_FLOAT64_T(*(_QWORD *)&v52));
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
