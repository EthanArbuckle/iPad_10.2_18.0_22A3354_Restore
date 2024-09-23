@implementation PAEVariableBlur

- (PAEVariableBlur)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEVariableBlur;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAEVariableBlur;
  -[PAESharedDefaultBase dealloc](&v2, sel_dealloc);
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

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsHeliumRendering"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("InputSizeLimit"), v7, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEVariableBlur;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("VariableBlur::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("VariableBlur::Amount"), 0, 0), 2, 0, 10.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("VariableBlur::InnerRadius"), 0, 0), 3, 0, 100.0, 0.0, 1000.0, 0.0, 1000.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("VariableBlur::OuterRadius"), 0, 0), 4, 0, 400.0, 0.0, 1000.0, 0.0, 1000.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("VariableBlur::Crop"), 0, 0), 5, 1, 1);
  }
  return v3 != 0;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  return 1;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  void *v10;
  BOOL v11;
  BOOL v12;
  void *v13;
  double v14;
  double v16;
  char v17;

  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (a3)
    v11 = a4 == 0;
  else
    v11 = 1;
  v12 = !v11;
  if (!v11)
  {
    v13 = v10;
    v17 = 0;
    objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v17, 5, a6->var0.var1);
    v16 = 0.0;
    v14 = 0.0;
    if (!v17)
    {
      objc_msgSend(v13, "getFloatValue:fromParm:atFxTime:", &v16, 2, a6->var0.var1, 0.0);
      v14 = v16 + v16;
    }
    *a3 = (unint64_t)(v14 + (double)a5->var0);
    *a4 = (unint64_t)(v14 + (double)a5->var1);
  }
  return v12;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  HgcVariableBlurIntensity *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  HGModulatedBlur *v33;
  float v34;
  float v35;
  float v36;
  float v37;
  double v38;
  uint64_t v39;
  float v40;
  unint64_t v41;
  float v42;
  double v43;
  double v44;
  __int128 v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  HGCrop *v68;
  HGOverwrite *v69;
  HGaussianBlur *v70;
  float v71;
  HGOverwrite *v72;
  float v74;
  float v75;
  double v76;
  double v77;
  double v78;
  double v79;
  float32x2_t v80;
  float32x2_t v81;
  float64x2_t v82;
  float64x2_t v83;
  HGModulatedBlur *v84;
  uint64_t v85;
  uint64_t v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95[3];
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  __int128 v103;
  char v104;
  double v105;
  double v106;
  double v107;
  __int128 v108;
  _OWORD v109[2];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
    return 0;
  v13 = objc_msgSend(v10, "versionAtCreation") == 0;
  v106 = 400.0;
  v107 = 10.0;
  v105 = 100.0;
  v104 = 0;
  v103 = 0uLL;
  objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v103, (char *)&v103 + 8, 1, a5->var0.var1);
  -[PAESharedDefaultBase convertRelativeToImageCoordinates:withImage:](self, "convertRelativeToImageCoordinates:withImage:", &v103, a4);
  v103 = *(_OWORD *)v95;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v107, 2, a5->var0.var1);
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v106, 3, a5->var0.var1);
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v105, 4, a5->var0.var1);
  if (v13)
  {
    v14 = v105;
    v105 = v106;
    v106 = v14;
  }
  objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v104, 5, a5->var0.var1);
  -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
  -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a4);
  v15 = v95[0];
  v16 = v98;
  v17 = objc_msgSend(a4, "imageType");
  if (-[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1))
    v18 = v17 == 3;
  else
    v18 = 0;
  v12 = v18;
  if (v18)
  {
    if (v107 <= 0.0)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef", v107);
      else
        *(_QWORD *)&v108 = 0;
      objc_msgSend(a3, "setHeliumRef:", &v108);
      if ((_QWORD)v108)
        (*(void (**)(_QWORD))(*(_QWORD *)v108 + 24))(v108);
    }
    else
    {
      if (a4)
        objc_msgSend(a4, "heliumRef", v107);
      else
        v86 = 0;
      if (v104)
      {
        v85 = v86;
        if (v86)
          (*(void (**)(uint64_t))(*(_QWORD *)v86 + 16))(v86);
        -[PAESharedDefaultBase smear:fromImage:toImage:](self, "smear:fromImage:toImage:", &v85, a4, a4);
        v19 = v108;
        if (v86 == (_QWORD)v108)
        {
          if (v86)
            (*(void (**)(void))(*(_QWORD *)v86 + 24))();
        }
        else
        {
          if (v86)
          {
            (*(void (**)(void))(*(_QWORD *)v86 + 24))();
            v19 = v108;
          }
          v86 = v19;
          *(_QWORD *)&v108 = 0;
        }
        if (v85)
          (*(void (**)(uint64_t))(*(_QWORD *)v85 + 24))(v85);
      }
      v20 = (HgcVariableBlurIntensity *)HGObject::operator new(0x1A0uLL);
      HgcVariableBlurIntensity::HgcVariableBlurIntensity(v20);
      v21 = *(double *)&v103;
      v22 = *((double *)&v103 + 1);
      (*(void (**)(HgcVariableBlurIntensity *, _QWORD, float, float, float, float))(*(_QWORD *)v20 + 96))(v20, 0, v21, v22, 0.0, 0.0);
      v23 = 1.0 / (v105 - v106);
      (*(void (**)(HgcVariableBlurIntensity *, uint64_t, float, float, float, float))(*(_QWORD *)v20 + 96))(v20, 1, v23, 0.0, 0.0, 0.0);
      v24 = v106;
      (*(void (**)(HgcVariableBlurIntensity *, uint64_t, float, float, float, float))(*(_QWORD *)v20 + 96))(v20, 2, v24, 0.0, 0.0, 0.0);
      v25 = v87;
      v26 = v88;
      v27 = v89;
      v28 = v90;
      (*(void (**)(HgcVariableBlurIntensity *, uint64_t, float, float, float, float))(*(_QWORD *)v20 + 96))(v20, 3, v25, v26, v27, v28);
      v29 = v91;
      v30 = v92;
      v31 = v93;
      v32 = v94;
      (*(void (**)(HgcVariableBlurIntensity *, uint64_t, float, float, float, float))(*(_QWORD *)v20 + 96))(v20, 4, v29, v30, v31, v32);
      v33 = (HGModulatedBlur *)HGObject::operator new(0x1D0uLL);
      HGModulatedBlur::HGModulatedBlur(v33);
      v84 = v33;
      if (v33)
        (*(void (**)(HGModulatedBlur *))(*(_QWORD *)v33 + 16))(v33);
      (*(void (**)(HGModulatedBlur *, _QWORD, uint64_t))(*(_QWORD *)v33 + 120))(v33, 0, v86);
      (*(void (**)(HGModulatedBlur *, uint64_t, HgcVariableBlurIntensity *))(*(_QWORD *)v33 + 120))(v33, 1, v20);
      v107 = v107 * 2.7;
      v34 = v107;
      (*(void (**)(HGModulatedBlur *, _QWORD, float, float, float, float))(*(_QWORD *)v33 + 96))(v33, 0, v34, 0.0, 0.0, 0.0);
      v35 = v15;
      v36 = v16;
      v37 = fabsf(v36);
      (*(void (**)(HGModulatedBlur *, uint64_t, float, float, float, float))(*(_QWORD *)v33 + 96))(v33, 1, v35, v37, 0.0, 0.0);
      v108 = xmmword_1B3050128;
      v109[0] = unk_1B3050138;
      *(_OWORD *)((char *)v109 + 12) = unk_1B3050144;
      v38 = v107;
      v40 = ceil(log2(v107)) + 1.0;
      if (v40 <= 0.0)
        v40 = 1.0;
      LODWORD(v39) = vcvtms_s32_f32(v40);
      if ((int)v39 >= 2)
      {
        v41 = v39 + 1;
        do
        {
          v42 = v38;
          *((float *)&v109[-1] + (v41 - 2)) = v42;
          v38 = v38 * 0.5;
          --v41;
        }
        while (v41 > 2);
      }
      HGModulatedBlur::setBlurValues(v33, (const float *)&v108, (unint64_t)v40);
      v44 = v105;
      v43 = v106;
      if (v106 <= v105)
      {
        v74 = v37;
        v75 = v35;
        v45 = v103;
        v46 = v100;
        v47 = v101;
        v48 = v102;
        v49 = v95[0];
        v50 = v97;
        v78 = v95[1];
        v79 = v96;
        v76 = v98;
        v77 = v99;
        -[PAESharedDefaultBase getImageBoundary:](self, "getImageBoundary:", a3);
        v82 = vcvtq_f64_f32(v80);
        v83 = vcvtq_f64_f32(v81);
        PCMatrix44Tmpl<double>::transformRect<double>(v95, v82.f64, (uint64_t)&v82);
        v43 = *((double *)&v45 + 1) - v44;
        v51 = (*(double *)&v45 - v44) * v46;
        v52 = (v44 + *((double *)&v45 + 1)) * v47;
        v53 = (v44 + *((double *)&v45 + 1)) * v78;
        v54 = (v79 + (*(double *)&v45 - v44) * v49 + v53) / (v48 + v51 + v52);
        v55 = (v44 + *(double *)&v45) * v46;
        v56 = v48 + v55 + v52;
        v57 = (v44 + *(double *)&v45) * v49;
        v58 = (v44 + *(double *)&v45) * v50;
        v59 = (*((double *)&v45 + 1) - v44) * v47;
        v60 = v48 + v55 + v59;
        v61 = (*((double *)&v45 + 1) - v44) * v76;
        v62 = (v77 + v58 + v61) / v60;
        v63 = (v77 + (*(double *)&v45 - v44) * v50 + v61) / (v48 + v51 + v59);
        if (v82.f64[0] < v54 && v54 < v82.f64[0] + v83.f64[0])
          goto LABEL_53;
        if ((v64 = (v79 + v57 + v53) / v56, v82.f64[0] < v64) && v64 < v82.f64[0] + v83.f64[0]
          || v82.f64[1] < v63 && v63 < v82.f64[1] + v83.f64[1]
          || v82.f64[1] < v62 && v62 < v82.f64[1] + v83.f64[1])
        {
LABEL_53:
          v65 = HGRectMake4i(vcvtmd_s64_f64(v54), vcvtmd_s64_f64(v63), vcvtpd_s64_f64(v54 + (v79 + v57 + v43 * v78) / v60 - v54), vcvtpd_s64_f64(v63 + (v77 + v58 + (v44 + *((double *)&v45 + 1)) * v76) / v56 - v62));
          v67 = v66;
          v68 = (HGCrop *)HGObject::operator new(0x1A0uLL);
          HGCrop::HGCrop(v68);
          (*(void (**)(HGCrop *, _QWORD, HGModulatedBlur *))(*(_QWORD *)v68 + 120))(v68, 0, v33);
          (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v68 + 96))(v68, 0, (float)(int)v65, (float)SHIDWORD(v65), (float)(int)v67, (float)SHIDWORD(v67));
          v69 = v33;
          if (v33 != v68)
          {
            (*(void (**)(HGModulatedBlur *))(*(_QWORD *)v33 + 24))(v33);
            v84 = v68;
            v69 = v68;
            (*(void (**)(HGCrop *))(*(_QWORD *)v68 + 16))(v68);
          }
          v70 = (HGaussianBlur *)HGObject::operator new(0x1B0uLL);
          HGaussianBlur::HGaussianBlur(v70);
          (*(void (**)(HGaussianBlur *, _QWORD, uint64_t))(*(_QWORD *)v70 + 120))(v70, 0, v86);
          v71 = v107;
          HGaussianBlur::init(v70, v71, v75, v74, 0, 0, 0);
          v72 = (HGOverwrite *)HGObject::operator new(0x1A0uLL);
          HGOverwrite::HGOverwrite(v72);
          (*(void (**)(HGOverwrite *, uint64_t, HGOverwrite *))(*(_QWORD *)v72 + 120))(v72, 1, v69);
          (*(void (**)(HGOverwrite *, _QWORD, HGaussianBlur *))(*(_QWORD *)v72 + 120))(v72, 0, v70);
          if (v69 != v72)
          {
            (*(void (**)(HGOverwrite *))(*(_QWORD *)v69 + 24))(v69);
            v84 = v72;
            (*(void (**)(HGOverwrite *))(*(_QWORD *)v72 + 16))(v72);
          }
          (*(void (**)(HGOverwrite *))(*(_QWORD *)v72 + 24))(v72);
          (*(void (**)(HGaussianBlur *))(*(_QWORD *)v70 + 24))(v70);
          (*(void (**)(HGCrop *))(*(_QWORD *)v68 + 24))(v68);
        }
      }
      if (v104)
        -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v84, a4, a3, v43);
      objc_msgSend(a3, "setHeliumRef:", &v84, v43);
      if (v84)
        (*(void (**)(HGModulatedBlur *))(*(_QWORD *)v84 + 24))(v84);
      (*(void (**)(HGModulatedBlur *))(*(_QWORD *)v33 + 24))(v33);
      (*(void (**)(HgcVariableBlurIntensity *))(*(_QWORD *)v20 + 24))(v20);
      if (v86)
        (*(void (**)(uint64_t))(*(_QWORD *)v86 + 24))(v86);
    }
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

- (BOOL)frameCleanup
{
  return 1;
}

@end
