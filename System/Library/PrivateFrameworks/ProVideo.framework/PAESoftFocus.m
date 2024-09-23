@implementation PAESoftFocus

- (PAESoftFocus)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAESoftFocus;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  void *v7;
  void *v8;
  _BOOL8 v9;
  objc_class *v10;
  id v11;
  id result;
  void *v13;
  uint64_t v14;
  __int16 v15;

  v7 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v15 = 0;
  if (!v7)
  {
    v9 = 1;
    goto LABEL_8;
  }
  v8 = v7;
  if (objc_msgSend(v7, "getBoolValue:fromParm:atFxTime:", (char *)&v15 + 1, 5, a3.var1)
    && objc_msgSend(v8, "getBoolValue:fromParm:atFxTime:", &v15, 6, a3.var1))
  {
    v9 = (HIBYTE(v15) | v15) == 0;
LABEL_8:
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    return (id)objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v14, CFSTR("PositionIndependent"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (_BYTE)v15 == 0), CFSTR("SupportsLargeRenderScale"), 0);
  }
  if (!a4)
    return 0;
  v10 = (objc_class *)objc_opt_class();
  v11 = -[PAEFilterDefaultBase getParamErrorFor:](self, "getParamErrorFor:", NSStringFromClass(v10));
  result = 0;
  *a4 = v11;
  return result;
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
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsHeliumRendering"), v5, CFSTR("InputSizeLimit"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
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
  v10.super_class = (Class)PAESoftFocus;
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
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SoftFocus::Amount"), 0, 0), 1, 0, 2.0, 0.0, dbl_1B3050110[v7], 0.0, 32.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SoftFocus::Strength"), 0, 0), 2, 0, 0.5, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SoftFocus::Horizontal"), 0, 0), 3, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SoftFocus::Vertical"), 0, 0), 4, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SoftFocus::Crop"), 0, 0), 5, 0, 33);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SoftFocus::Equirect"), 0, 0), 6, 0, 1);
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
  int64x2_t v15;
  float64x2_t v16;
  float v17;
  int32x2_t v18;
  char v20;
  double v21;
  double v22;
  double v23;
  char v24;

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
    v24 = 0;
    objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v24, 6, a6->var0.var1);
    if (v24)
    {
      *a3 = a5->var0;
      *a4 = a5->var1;
    }
    else
    {
      v23 = 0.0;
      objc_msgSend(v14, "getFloatValue:fromParm:atFxTime:", &v23, 1, a6->var0.var1);
      v22 = 0.0;
      objc_msgSend(v14, "getFloatValue:fromParm:atFxTime:", &v22, 3, a6->var0.var1);
      v22 = v22 * 0.01;
      v21 = 0.0;
      objc_msgSend(v14, "getFloatValue:fromParm:atFxTime:", &v21, 4, a6->var0.var1);
      v21 = v21 * 0.01;
      v20 = 0;
      objc_msgSend(v14, "getBoolValue:fromParm:atFxTime:", &v20, 5, a6->var0.var1);
      v15 = *(int64x2_t *)&a5->var0;
      if (!v20)
      {
        v16.f64[0] = v22;
        v17 = v23 + v23;
        v16.f64[1] = v21;
        v18 = vmovn_s64(vcvtq_s64_f64(vrndpq_f64(vmulq_n_f64(v16, v17))));
        v15 = vaddw_s32(v15, vadd_s32(v18, v18));
      }
      *a3 = v15.i64[0];
      *a4 = v15.u64[1];
    }
  }
  return v13 ^ 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  HGNode *v16;
  unint64_t v17;
  double v18;
  unint64_t v19;
  double v20;
  float v21;
  float v22;
  float v23;
  double v24;
  HGLegacyBlend *v25;
  float v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  HGCrop *v31;
  HGTextureWrap *v33;
  char *v34;
  HGCrop *v35;
  uint64_t v36;
  uint64_t v37;
  float64_t v38;
  HSoftFocus *v39;
  float v40;
  float v41;
  float v42;
  float v43;
  HGCrop *v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  float v49;
  float v50;
  float v51;
  float v52;
  HGNode *v53;
  float32x4_t v54;
  double v55;
  double v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float64x2_t v60[8];
  HGNode *v61;
  char v62;
  char v63;
  double v64;
  double v65;
  double v66;
  double v67[17];
  float64x2_t v68[2];
  float64x2_t v69;
  float64x2_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
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
  -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
  v14 = v67[1];
  v15 = v67[6];
  v67[0] = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", v67, 1, a5->var0.var1);
  v67[0] = v67[0] * 0.5;
  v66 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v66, 3, a5->var0.var1);
  v66 = v14 * (v66 * 0.01);
  v65 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v65, 4, a5->var0.var1);
  v65 = fabs(v15) * (v65 * 0.01);
  v64 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v64, 2, a5->var0.var1);
  v63 = 0;
  objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v63, 5, a5->var0.var1);
  v62 = 0;
  objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v62, 6, a5->var0.var1);
  v63 &= v62 ^ 1;
  if (!a4)
  {
    v61 = 0;
    if (v62)
      goto LABEL_8;
LABEL_13:
    if (v63)
    {
      if (!v13)
      {
        v33 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
        HGTextureWrap::HGTextureWrap(v33);
        HGTextureWrap::SetTextureWrapMode((uint64_t)v33, 0, v34);
        v68[0] = 0uLL;
        HGTextureWrap::SetTextureBorderColor(v33, (float *)v68);
        (*(void (**)(HGTextureWrap *, _QWORD, HGNode *))(*(_QWORD *)v33 + 120))(v33, 0, v61);
        v35 = (HGCrop *)HGObject::operator new(0x1A0uLL);
        HGCrop::HGCrop(v35);
        -[PAESharedDefaultBase getImageBoundary:](self, "getImageBoundary:", a4);
        v36 = HGRectMake4i((int)*(float *)v60[0].f64, (int)*((float *)v60[0].f64 + 1), (int)*(float *)&v60[0].f64[1] + (int)*(float *)v60[0].f64, (int)*((float *)&v60[0].f64[1] + 1) + (int)*((float *)v60[0].f64 + 1));
        (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v35 + 96))(v35, 0, (float)(int)v36, (float)SHIDWORD(v36), (float)(v37 + 1), (float)(int)((unint64_t)(v37 + 0x100000000) >> 32));
        (*(void (**)(HGCrop *, _QWORD, HGTextureWrap *))(*(_QWORD *)v35 + 120))(v35, 0, v33);
        if (v61 != (HGNode *)v35)
        {
          if (v61)
            (*(void (**)(void))(*(_QWORD *)v61 + 24))();
          v61 = (HGNode *)v35;
          (*(void (**)(HGCrop *))(*(_QWORD *)v35 + 16))(v35);
        }
        (*(void (**)(HGCrop *))(*(_QWORD *)v35 + 24))(v35);
        (*(void (**)(HGTextureWrap *))(*(_QWORD *)v33 + 24))(v33);
      }
      v53 = v61;
      if (v61)
        (*(void (**)(HGNode *))(*(_QWORD *)v61 + 16))(v61);
      -[PAESharedDefaultBase smear:fromImage:toImage:](self, "smear:fromImage:toImage:", &v53, a4, a4);
      v38 = v68[0].f64[0];
      if (v61 == *(HGNode **)&v68[0].f64[0])
      {
        if (v61)
          (*(void (**)(void))(*(_QWORD *)v61 + 24))();
      }
      else
      {
        if (v61)
        {
          (*(void (**)(void))(*(_QWORD *)v61 + 24))();
          v38 = v68[0].f64[0];
        }
        v61 = *(HGNode **)&v38;
        v68[0].f64[0] = 0.0;
      }
      if (v53)
        (*(void (**)(HGNode *))(*(_QWORD *)v53 + 24))(v53);
    }
    v39 = (HSoftFocus *)HGObject::operator new(0x1B0uLL);
    HSoftFocus::HSoftFocus(v39);
    v40 = v67[0];
    v41 = v64;
    v42 = v66;
    v43 = v65;
    HSoftFocus::init(v39, v40, v41, v42, v43, v13 == 0);
    (*(void (**)(HSoftFocus *, _QWORD, HGNode *))(*(_QWORD *)v39 + 120))(v39, 0, v61);
    if (v63)
    {
      v44 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v44);
      (*(void (**)(HGCrop *, _QWORD, HSoftFocus *))(*(_QWORD *)v44 + 120))(v44, 0, v39);
      v45 = objc_msgSend(a4, "width");
      v46 = objc_msgSend(a4, "height");
      v47 = objc_msgSend(a4, "width");
      v48 = objc_msgSend(a4, "height");
      v49 = (double)v45 * -0.5;
      v50 = (double)v46 * -0.5;
      v51 = (double)v47 * 0.5;
      v52 = (double)v48 * 0.5;
      (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v44 + 96))(v44, 0, v49, v50, v51, v52);
      *(_QWORD *)&v68[0].f64[0] = v44;
      (*(void (**)(HGCrop *))(*(_QWORD *)v44 + 16))(v44);
      objc_msgSend(a3, "setHeliumRef:", v68);
      if (*(_QWORD *)&v68[0].f64[0])
        (*(void (**)(_QWORD))(**(_QWORD **)&v68[0].f64[0] + 24))(*(_QWORD *)&v68[0].f64[0]);
      (*(void (**)(HGCrop *))(*(_QWORD *)v44 + 24))(v44);
    }
    else
    {
      *(_QWORD *)&v68[0].f64[0] = v39;
      (*(void (**)(HSoftFocus *))(*(_QWORD *)v39 + 16))(v39);
      objc_msgSend(a3, "setHeliumRef:", v68);
      if (*(_QWORD *)&v68[0].f64[0])
        (*(void (**)(_QWORD))(**(_QWORD **)&v68[0].f64[0] + 24))(*(_QWORD *)&v68[0].f64[0]);
    }
    (*(void (**)(HSoftFocus *))(*(_QWORD *)v39 + 24))(v39);
    goto LABEL_37;
  }
  objc_msgSend(a4, "heliumRef");
  if (!v62)
    goto LABEL_13;
LABEL_8:
  -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
  -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a3);
  v16 = (HGNode *)HGObject::operator new(0x1C0uLL);
  HGNode::HGNode(v16);
  *(_QWORD *)v16 = off_1E64E3B98;
  *((_QWORD *)v16 + 51) = 0;
  *((_QWORD *)v16 + 52) = 0;
  *((_DWORD *)v16 + 106) = 0;
  *((_QWORD *)v16 + 54) = 0;
  *((_QWORD *)v16 + 55) = 0;
  HGNode::SetInput(v16, 0, v61);
  v17 = objc_msgSend(a4, "width");
  v18 = v68[0].f64[0];
  v19 = objc_msgSend(a4, "height");
  v20 = ceil(fabs(v18) * (double)v17);
  v21 = v67[0];
  v22 = v66;
  v23 = v65;
  v54 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v68[0]), v68[1]);
  v24 = fabs(v69.f64[1]) * (double)v19;
  v59 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v69), v70);
  v58 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v60[0]), v60[1]);
  v57 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v60[2]), v60[3]);
  HEquirectGaussianBlur::init((uint64_t)v16, (int)v20, vcvtpd_s64_f64(v24), (float32x2_t *)&v54, (float32x2_t *)&v59, (float32x2_t *)&v58, (float32x2_t *)&v57, v21, v22, v23);
  v25 = (HGLegacyBlend *)HGObject::operator new(0x1C0uLL);
  HGLegacyBlend::HGLegacyBlend(v25);
  (*(void (**)(HGLegacyBlend *, _QWORD, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 0, 8.0, 0.0, 0.0, 0.0);
  v26 = v64;
  (*(void (**)(HGLegacyBlend *, uint64_t, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 1, v26, 0.0, 0.0, 0.0);
  (*(void (**)(HGLegacyBlend *, uint64_t, HGNode *))(*(_QWORD *)v25 + 120))(v25, 1, v16);
  (*(void (**)(HGLegacyBlend *, _QWORD, HGNode *))(*(_QWORD *)v25 + 120))(v25, 0, v61);
  v27 = ceil(v24);
  *(double *)v54.i64 = v20 * -0.5;
  *(double *)&v54.i64[1] = v27 * -0.5;
  v55 = v20;
  v56 = v27;
  PCMatrix44Tmpl<double>::transformRect<double>(v60[0].f64, (double *)v54.i64, (uint64_t)&v54);
  v28 = HGRectMake4i(vcvtmd_s64_f64(*(double *)v54.i64), vcvtmd_s64_f64(*(double *)&v54.i64[1]), vcvtpd_s64_f64(*(double *)v54.i64 + v55), vcvtpd_s64_f64(*(double *)&v54.i64[1] + v56));
  v30 = v29;
  v31 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v31);
  (*(void (**)(HGCrop *, _QWORD, HGLegacyBlend *))(*(_QWORD *)v31 + 120))(v31, 0, v25);
  (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v31 + 96))(v31, 0, (float)(int)v28, (float)SHIDWORD(v28), (float)(int)v30, (float)SHIDWORD(v30));
  v59.i64[0] = (uint64_t)v31;
  (*(void (**)(HGCrop *))(*(_QWORD *)v31 + 16))(v31);
  objc_msgSend(a3, "setHeliumRef:", &v59);
  if (v59.i64[0])
    (*(void (**)(uint64_t))(*(_QWORD *)v59.i64[0] + 24))(v59.i64[0]);
  (*(void (**)(HGCrop *))(*(_QWORD *)v31 + 24))(v31);
  (*(void (**)(HGLegacyBlend *))(*(_QWORD *)v25 + 24))(v25);
  (*(void (**)(HGNode *))(*(_QWORD *)v16 + 24))(v16);
LABEL_37:
  if (v61)
    (*(void (**)(HGNode *))(*(_QWORD *)v61 + 24))(v61);
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
