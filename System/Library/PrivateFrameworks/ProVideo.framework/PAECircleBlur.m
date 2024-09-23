@implementation PAECircleBlur

- (PAECircleBlur)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAECircleBlur;
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
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("SupportsHeliumRendering"), v5, CFSTR("MayRemapTime"), v6, CFSTR("SupportsLargeRenderScale"), v7, CFSTR("InputSizeLimit"), v8, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  unsigned int v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PAECircleBlur;
  -[PAESharedDefaultBase addParameters](&v10, sel_addParameters);
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
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CircleBlur::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CircleBlur::Blur Amount"), 0, 0), 2, 0, 10.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CircleBlur::Circle Radius"), 0, 0), 3, 0, 400.0, 0.0, dbl_1B3050070[v7 < 3], 0.0, dbl_1B3050080[v7 < 3], 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CircleBlur::Crop"), 0, 0), 4, 1, 1);
  }
  return v6;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  PAECircleBlur *v6;
  PAECircleBlur *v11;
  double v12;
  double v14;
  char v15;

  v6 = self;
  LOBYTE(self) = 0;
  if (a3)
  {
    if (a4)
    {
      self = (PAECircleBlur *)-[PROAPIAccessing apiForProtocol:](v6->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
      if (self)
      {
        v11 = self;
        v15 = 0;
        -[PAECircleBlur getBoolValue:fromParm:atFxTime:](self, "getBoolValue:fromParm:atFxTime:", &v15, 4, a6->var0.var1);
        v14 = 0.0;
        v12 = 0.0;
        if (!v15)
        {
          -[PAECircleBlur getFloatValue:fromParm:atFxTime:](v11, "getFloatValue:fromParm:atFxTime:", &v14, 2, a6->var0.var1, 0.0);
          v12 = v14 * 1.8 + v14 * 1.8;
        }
        *a3 = (unint64_t)(v12 + (double)a5->var0);
        *a4 = (unint64_t)(v12 + (double)a5->var1);
        LOBYTE(self) = 1;
      }
    }
  }
  return (char)self;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  unsigned int v13;
  id v14;
  int v15;
  uint64_t v16;
  float64x2_t v17;
  BOOL v18;
  HGNode *v19;
  unint64_t v20;
  double v21;
  float64x2_t v22;
  float64x2_t v23;
  float v24;
  int32x4_t v25;
  int32x4_t v26;
  float32x4_t v27;
  float64x2_t v28;
  float64x2_t v29;
  HgcCircleBlur2 *v30;
  HgcCircleBlur2 *v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  HGNode *v50;
  HGBlurGroup *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  HGNode *v57;
  HGBlurGroup *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  HgcCircleBlur2 *v64;
  HGNode *v65;
  HGNode *v66;
  float64x2_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _OWORD v75[8];
  __int128 v76;
  char v77;
  double v78;
  double v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  float64x2_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  float v96[4];
  float v97;
  _QWORD v98[2];
  float v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
    return 0;
  v13 = objc_msgSend(v10, "versionAtCreation");
  -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
  -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
  if (!v13)
  {
    v88.f64[0] = 1.0;
    *((_QWORD *)&v90 + 1) = 0x3FF0000000000000;
  }
  v78 = 400.0;
  v79 = 10.0;
  v77 = 1;
  v76 = 0uLL;
  objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v76, (char *)&v76 + 8, 1, a5->var0.var1);
  if (v13 >= 2)
    v14 = a4;
  else
    v14 = a3;
  -[PAESharedDefaultBase convertRelativeToImageCoordinates:withImage:](self, "convertRelativeToImageCoordinates:withImage:", &v76, v14);
  v76 = v75[0];
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v79, 2, a5->var0.var1);
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v78, 3, a5->var0.var1);
  objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v77, 4, a5->var0.var1);
  v15 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  v16 = objc_msgSend(a4, "imageType");
  v75[5] = v85;
  v75[6] = v86;
  v75[7] = v87;
  v75[1] = v81;
  v75[2] = v82;
  v75[3] = v83;
  v75[4] = v84;
  v71 = v92;
  v72 = v93;
  v73 = v94;
  v74 = v95;
  v75[0] = v80;
  v67 = v88;
  v68 = v89;
  v69 = v90;
  v70 = v91;
  PCMatrix44Tmpl<double>::rightTranslate((double *)v75, *(double *)&v76, *((double *)&v76 + 1), 0.0);
  v17.f64[0] = -*(double *)&v76;
  PCMatrix44Tmpl<double>::leftTranslate(&v67, v17, -*((double *)&v76 + 1), 0.0);
  if (v15)
    v18 = v16 == 3;
  else
    v18 = 0;
  v12 = v18;
  if (v18)
  {
    if (v79 == 0.0)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef", v79);
      else
        v98[0] = 0;
      objc_msgSend(a3, "setHeliumRef:", v98);
      if (v98[0])
        (*(void (**)(_QWORD))(*(_QWORD *)v98[0] + 24))(v98[0]);
    }
    else
    {
      if (a4)
        objc_msgSend(a4, "heliumRef", v79);
      else
        v66 = 0;
      if (v77)
      {
        v65 = v66;
        if (v66)
          (*(void (**)(HGNode *))(*(_QWORD *)v66 + 16))(v66);
        -[PAESharedDefaultBase smear:fromImage:toImage:](self, "smear:fromImage:toImage:", &v65, a4, a4);
        v19 = (HGNode *)v98[0];
        if (v66 == (HGNode *)v98[0])
        {
          if (v66)
            (*(void (**)(void))(*(_QWORD *)v66 + 24))();
        }
        else
        {
          if (v66)
          {
            (*(void (**)(void))(*(_QWORD *)v66 + 24))();
            v19 = (HGNode *)v98[0];
          }
          v66 = v19;
          v98[0] = 0;
        }
        if (v65)
          (*(void (**)(HGNode *))(*(_QWORD *)v65 + 24))(v65);
      }
      v20 = 0;
      v21 = v79 * 2.7;
      v22 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v67.f64[0], 0);
      v23 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(fabs(*((double *)&v69 + 1))), 0);
      v24 = v79 * 2.7 / 7.0;
      v25 = (int32x4_t)xmmword_1B3050090;
      v26.i64[0] = 0x400000004;
      v26.i64[1] = 0x400000004;
      do
      {
        v27 = vmulq_n_f32(vcvtq_f32_s32(v25), v24);
        v28 = vcvtq_f64_f32(*(float32x2_t *)v27.f32);
        v29 = vcvt_hight_f64_f32(v27);
        *(float32x4_t *)&v98[v20 / 2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(v28, v22)), vdivq_f64(v29, v22));
        *(float32x4_t *)&v96[v20] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(v28, v23)), vdivq_f64(v29, v23));
        v25 = vaddq_s32(v25, v26);
        v20 += 4;
      }
      while (v20 != 8);
      v79 = v21 * 7.0 / 100.0;
      v30 = (HgcCircleBlur2 *)HGObject::operator new(0x1A0uLL);
      HgcCircleBlur2::HgcCircleBlur2(v30);
      v31 = (HgcCircleBlur2 *)HGObject::operator new(0x1A0uLL);
      HgcCircleBlur2::HgcCircleBlur2(v31);
      v32 = 1.0 / v78;
      (*(void (**)(HgcCircleBlur2 *, uint64_t, float, float, float, float))(*(_QWORD *)v30 + 96))(v30, 1, v32, 0.0, 0.0, 0.0);
      v33 = 1.0 / v78;
      (*(void (**)(HgcCircleBlur2 *, uint64_t, float, float, float, float))(*(_QWORD *)v31 + 96))(v31, 1, v33, 0.0, 0.0, 0.0);
      v34 = v67.f64[0];
      v35 = v67.f64[1];
      v36 = *(double *)&v68;
      v37 = *((double *)&v68 + 1);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, float, float, float, float))(*(_QWORD *)v30 + 96))(v30, 2, v34, v35, v36, v37);
      v38 = v67.f64[0];
      v39 = v67.f64[1];
      v40 = *(double *)&v68;
      v41 = *((double *)&v68 + 1);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, float, float, float, float))(*(_QWORD *)v31 + 96))(v31, 2, v38, v39, v40, v41);
      v42 = *(double *)&v69;
      v43 = *((double *)&v69 + 1);
      v44 = *(double *)&v70;
      v45 = *((double *)&v70 + 1);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, float, float, float, float))(*(_QWORD *)v30 + 96))(v30, 3, v42, v43, v44, v45);
      v46 = *(double *)&v69;
      v47 = *((double *)&v69 + 1);
      v48 = *(double *)&v70;
      v49 = *((double *)&v70 + 1);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, float, float, float, float))(*(_QWORD *)v31 + 96))(v31, 3, v46, v47, v48, v49);
      v50 = v66;
      v51 = (HGBlurGroup *)HGObject::operator new(0x70uLL);
      HGBlurGroup::HGBlurGroup(v51, v50, 0);
      HGBlurGroup::setBlurValues(v51, (const float *)v98, v96, 5);
      (*(void (**)(HgcCircleBlur2 *, _QWORD, float, float, float, float))(*(_QWORD *)v30 + 96))(v30, 0, 0.0, 0.0, 0.0, 0.0);
      v52 = HGBlurGroup::level(v51, 0);
      (*(void (**)(HgcCircleBlur2 *, _QWORD, uint64_t))(*(_QWORD *)v30 + 120))(v30, 0, v52);
      v53 = HGBlurGroup::level(v51, 1u);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, uint64_t))(*(_QWORD *)v30 + 120))(v30, 1, v53);
      v54 = HGBlurGroup::level(v51, 2u);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, uint64_t))(*(_QWORD *)v30 + 120))(v30, 2, v54);
      v55 = HGBlurGroup::level(v51, 3u);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, uint64_t))(*(_QWORD *)v30 + 120))(v30, 3, v55);
      v56 = HGBlurGroup::level(v51, 4u);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, uint64_t))(*(_QWORD *)v30 + 120))(v30, 4, v56);
      if (v51)
        (*(void (**)(HGBlurGroup *))(*(_QWORD *)v51 + 24))(v51);
      v57 = v66;
      v58 = (HGBlurGroup *)HGObject::operator new(0x70uLL);
      HGBlurGroup::HGBlurGroup(v58, v57, 0);
      HGBlurGroup::setBlurValues(v58, &v99, &v97, 4);
      (*(void (**)(HgcCircleBlur2 *, _QWORD, float, float, float, float))(*(_QWORD *)v31 + 96))(v31, 0, 1.0, 0.0, 0.0, 0.0);
      (*(void (**)(HgcCircleBlur2 *, _QWORD, HgcCircleBlur2 *))(*(_QWORD *)v31 + 120))(v31, 0, v30);
      v59 = HGBlurGroup::level(v58, 0);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, uint64_t))(*(_QWORD *)v31 + 120))(v31, 1, v59);
      v60 = HGBlurGroup::level(v58, 1u);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, uint64_t))(*(_QWORD *)v31 + 120))(v31, 2, v60);
      v61 = HGBlurGroup::level(v58, 2u);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, uint64_t))(*(_QWORD *)v31 + 120))(v31, 3, v61);
      v62 = HGBlurGroup::level(v58, 3u);
      (*(void (**)(HgcCircleBlur2 *, uint64_t, uint64_t))(*(_QWORD *)v31 + 120))(v31, 4, v62);
      if (v58)
        (*(void (**)(HGBlurGroup *))(*(_QWORD *)v58 + 24))(v58);
      v64 = v31;
      (*(void (**)(HgcCircleBlur2 *))(*(_QWORD *)v31 + 16))(v31);
      if (v77)
        -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v64, a4, a3);
      objc_msgSend(a3, "setHeliumRef:", &v64);
      if (v64)
        (*(void (**)(HgcCircleBlur2 *))(*(_QWORD *)v64 + 24))(v64);
      (*(void (**)(HgcCircleBlur2 *))(*(_QWORD *)v31 + 24))(v31);
      (*(void (**)(HgcCircleBlur2 *))(*(_QWORD *)v30 + 24))(v30);
      if (v66)
        (*(void (**)(HGNode *))(*(_QWORD *)v66 + 24))(v66);
    }
  }
  return v12;
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
