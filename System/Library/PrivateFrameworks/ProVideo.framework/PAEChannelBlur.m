@implementation PAEChannelBlur

- (PAEChannelBlur)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEChannelBlur;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  uint64_t v11;
  id result;
  objc_class *v13;
  id v14;
  double v15;
  __int16 v16;

  v7 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v8 = v7;
  v16 = 0;
  if (!v7
    || objc_msgSend(v7, "getBoolValue:fromParm:atFxTime:", (char *)&v16 + 1, 8, a3.var1)
    && (objc_msgSend(v8, "getBoolValue:fromParm:atFxTime:", &v16, 9, a3.var1) & 1) != 0)
  {
    v15 = 0.0;
    v9 = 1;
    objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v15, 1, a3.var1);
    v10 = (void *)MEMORY[0x1E0C99D80];
    if (HIBYTE(v16) | v16)
      v9 = v15 == 0.0;
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    return (id)objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, CFSTR("PositionIndependent"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (_BYTE)v16 == 0), CFSTR("SupportsLargeRenderScale"), 0);
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
  v10.super_class = (Class)PAEChannelBlur;
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
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ChannelBlur::Amount"), 0, 0), 1, 0, 4.0, 0.0, dbl_1B3050050[v7], 0.0, 64.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ChannelBlur::Blur Red"), 0, 0), 2, 1, 1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ChannelBlur::Blur Green"), 0, 0), 3, 1, 1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ChannelBlur::Blur Blue"), 0, 0), 4, 1, 1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ChannelBlur::Blur Alpha"), 0, 0), 5, 1, 1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ChannelBlur::Horizontal"), 0, 0), 6, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ChannelBlur::Vertical"), 0, 0), 7, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ChannelBlur::Crop"), 0, 0), 8, 0, 33);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ChannelBlur::Equirect"), 0, 0), 9, 0, 1);
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
    objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v24, 9, a6->var0.var1);
    if (v24)
    {
      *a3 = a5->var0;
      *a4 = a5->var1;
    }
    else
    {
      v23 = 0.0;
      objc_msgSend(v14, "getFloatValue:fromParm:atFxTime:", &v23, 1, a6->var0.var1);
      v23 = v23 * 0.5;
      v22 = 0.0;
      objc_msgSend(v14, "getFloatValue:fromParm:atFxTime:", &v22, 6, a6->var0.var1);
      v22 = v22 * 0.01;
      v21 = 0.0;
      objc_msgSend(v14, "getFloatValue:fromParm:atFxTime:", &v21, 7, a6->var0.var1);
      v21 = v21 * 0.01;
      v20 = 0;
      objc_msgSend(v14, "getBoolValue:fromParm:atFxTime:", &v20, 8, a6->var0.var1);
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
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  HgcChannelBlurNoPremult *v34;
  HGCrop *v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  _OWORD v45[9];
  float64x2_t v46[2];
  float64x2_t v47;
  float64x2_t v48;
  uint64_t v49;
  unsigned __int8 v50;
  unsigned __int8 v51;
  char v52;
  char v53;
  char v54;
  char v55;
  double v56;
  double v57;
  double v58[3];

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
  -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4);
  v14 = v58[1];
  v15 = v58[2];
  v58[0] = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", v58, 1, a5->var0.var1);
  v58[0] = v58[0] * 0.5;
  v57 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v57, 6, a5->var0.var1);
  v57 = v14 * (v57 * 0.01);
  v56 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v56, 7, a5->var0.var1);
  v56 = v15 * (v56 * 0.01);
  v55 = 0;
  objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v55, 2, a5->var0.var1);
  v54 = 0;
  objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v54, 3, a5->var0.var1);
  v53 = 0;
  objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v53, 4, a5->var0.var1);
  v52 = 0;
  objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v52, 5, a5->var0.var1);
  v51 = 0;
  objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v51, 8, a5->var0.var1);
  v50 = 0;
  objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v50, 9, a5->var0.var1);
  if (a4)
    objc_msgSend(a4, "heliumRef");
  else
    v49 = 0;
  if (v58[0] == 0.0)
  {
    objc_msgSend(a3, "setHeliumRef:", &v49, v58[0]);
  }
  else
  {
    if (v50)
    {
      -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3, v58[0]);
      -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a3);
      v17 = (HGNode *)HGObject::operator new(0x1C0uLL);
      HGNode::HGNode(v17);
      *(_QWORD *)v17 = off_1E64E3B98;
      *((_QWORD *)v17 + 51) = 0;
      *((_QWORD *)v17 + 52) = 0;
      *((_DWORD *)v17 + 106) = 0;
      *((_QWORD *)v17 + 54) = 0;
      *((_QWORD *)v17 + 55) = 0;
      v18 = v57;
      v19 = v58[0];
      v20 = v56;
      v21 = objc_msgSend(a4, "width");
      v22 = v46[0].f64[0];
      v23 = objc_msgSend(a4, "height");
      v24 = v19;
      v25 = v18;
      v26 = v20;
      v45[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v46[0]), v46[1]);
      v44 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v47), v48);
      v43 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)((char *)&v45[1] + 8)), *(float64x2_t *)((char *)&v45[2] + 8));
      v42 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)((char *)&v45[3] + 8)), *(float64x2_t *)((char *)&v45[4] + 8));
      HEquirectGaussianBlur::init((uint64_t)v17, vcvtpd_s64_f64(v22 * (double)v21), vcvtpd_s64_f64(vmuld_lane_f64((double)v23, v47, 1)), (float32x2_t *)v45, (float32x2_t *)&v44, (float32x2_t *)&v43, (float32x2_t *)&v42, v24, v25, v26);
      (*(void (**)(HGNode *, _QWORD, uint64_t))(*(_QWORD *)v17 + 120))(v17, 0, v49);
      (*(void (**)(HGNode *))(*(_QWORD *)v17 + 16))(v17);
      (*(void (**)(HGNode *))(*(_QWORD *)v17 + 24))(v17);
    }
    else
    {
      v17 = (HGNode *)HGObject::operator new(0x1B0uLL);
      HGaussianBlur::HGaussianBlur((HGaussianBlur *)v17);
      v27 = v58[0];
      v28 = v57;
      v29 = v56;
      HGaussianBlur::init((HGaussianBlur *)v17, v27, v28, v29, v13 == 0, 0, 0);
      (*(void (**)(HGNode *, _QWORD, uint64_t))(*(_QWORD *)v17 + 120))(v17, 0, v49);
      (*(void (**)(HGNode *))(*(_QWORD *)v17 + 16))(v17);
      (*(void (**)(HGNode *))(*(_QWORD *)v17 + 24))(v17);
    }
    if (v55)
      v30 = 1.0;
    else
      v30 = 0.0;
    if (v54)
      v31 = 1.0;
    else
      v31 = 0.0;
    if (v53)
      v32 = 1.0;
    else
      v32 = 0.0;
    if (v52)
      v33 = 1.0;
    else
      v33 = 0.0;
    v46[0].f64[0] = 0.0;
    if (v52)
    {
      v34 = (HgcChannelBlurNoPremult *)HGObject::operator new(0x1A0uLL);
      HgcChannelBlurNoPremult::HgcChannelBlurNoPremult(v34);
    }
    else
    {
      v34 = (HgcChannelBlurNoPremult *)HGObject::operator new(0x1A0uLL);
      HgcChannelBlur::HgcChannelBlur(v34);
    }
    if (v34)
      *(_QWORD *)&v46[0].f64[0] = v34;
    (*(void (**)(HgcChannelBlurNoPremult *, uint64_t, HGNode *))(*(_QWORD *)v34 + 120))(v34, 1, v17);
    (*(void (**)(HgcChannelBlurNoPremult *, _QWORD, float, float, float, float))(*(_QWORD *)v34 + 96))(v34, 0, v30, v31, v32, v33);
    (*(void (**)(HgcChannelBlurNoPremult *, _QWORD, uint64_t))(*(_QWORD *)v34 + 120))(v34, 0, v49);
    if (v51 | v50)
    {
      v35 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v35);
      v36 = objc_msgSend(a4, "width");
      if (v36 >= 0)
        v37 = v36;
      else
        v37 = v36 + 1;
      v38 = objc_msgSend(a4, "width");
      v39 = objc_msgSend(a4, "height");
      if (v39 >= 0)
        v40 = v39;
      else
        v40 = v39 + 1;
      v41 = objc_msgSend(a4, "height");
      (*(void (**)(HGCrop *, _QWORD, HgcChannelBlurNoPremult *))(*(_QWORD *)v35 + 120))(v35, 0, v34);
      (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v35 + 96))(v35, 0, (float)-(v37 >> 1), (float)-(v40 >> 1), (float)(v38 - (v37 >> 1)), (float)(v41 - (v40 >> 1)));
      if (v34 != v35)
      {
        (*(void (**)(HgcChannelBlurNoPremult *))(*(_QWORD *)v34 + 24))(v34);
        *(_QWORD *)&v46[0].f64[0] = v35;
        (*(void (**)(HGCrop *))(*(_QWORD *)v35 + 16))(v35);
      }
      (*(void (**)(HGCrop *))(*(_QWORD *)v35 + 24))(v35);
    }
    objc_msgSend(a3, "setHeliumRef:", v46);
    if (*(_QWORD *)&v46[0].f64[0])
      (*(void (**)(_QWORD))(**(_QWORD **)&v46[0].f64[0] + 24))(*(_QWORD *)&v46[0].f64[0]);
    (*(void (**)(HGNode *))(*(_QWORD *)v17 + 24))(v17);
  }
  if (v49)
    (*(void (**)(uint64_t))(*(_QWORD *)v49 + 24))(v49);
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
