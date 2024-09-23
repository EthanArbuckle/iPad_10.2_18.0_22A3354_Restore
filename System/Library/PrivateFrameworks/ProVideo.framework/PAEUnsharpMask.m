@implementation PAEUnsharpMask

- (PAEUnsharpMask)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEUnsharpMask;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id result;
  objc_class *v12;
  id v13;
  char v14;
  double v15;

  v7 = -[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4);
  v15 = 0.0;
  v14 = 0;
  if (objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v15, 2, a3.var1)
    && (objc_msgSend(v7, "getBoolValue:fromParm:atFxTime:", &v14, 6, a3.var1) & 1) != 0)
  {
    if (v15 == 0.0)
      v8 = 6;
    else
      v8 = 1;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8, v15);
    return (id)objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14 == 0), CFSTR("SupportsLargeRenderScale"), 0);
  }
  else if (a4)
  {
    v12 = (objc_class *)objc_opt_class();
    v13 = -[PAEFilterDefaultBase getParamErrorFor:](self, "getParamErrorFor:", NSStringFromClass(v12));
    result = 0;
    *a4 = v13;
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
  v6.super_class = (Class)PAEUnsharpMask;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A6DD0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Unsharpmask::Radius"), 0, 0), 1, 0, 7.0, 0.0, 32.0, 0.0, 32.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Unsharpmask::Amount"), 0, 0), 2, 0, 1.0, 0.0, 2.0, 0.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Unsharpmask::Threshold"), 0, 0), 3, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Unsharpmask::Horizontal"), 0, 0), 4, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Unsharpmask::Vertical"), 0, 0), 5, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Unsharpmask::Equirect"), 0, 0), 6, 0, 1);
  }
  return v3 != 0;
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
  double v17;
  double v18;
  double v19;
  HGNode *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  int v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  HgcUnsharpMask *v34;
  float v35;
  float v36;
  unint64_t v37;
  double v38;
  unint64_t v39;
  double v40;
  double v41;
  float v42;
  float v43;
  float v44;
  float v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  HGCrop *v50;
  HGColorClamp *v51;
  __int128 v52;
  double v53;
  double v54;
  __int128 v55;
  double v56;
  float32x2_t v57[17];
  HgcUnsharpMask *v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;

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
  v70 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v70, 2, a5->var0.var1);
  if (v70 == 0.0)
  {
    if (a4)
      objc_msgSend(a4, "heliumRef", v70);
    else
      v57[0] = 0;
    objc_msgSend(a3, "setHeliumRef:", v57);
    if (v57[0])
      (*(void (**)(_QWORD))(**(_QWORD **)v57 + 24))(*(_QWORD *)v57);
  }
  else
  {
    v14 = objc_msgSend(v12, "versionAtCreation", v70);
    -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4);
    v15 = v68;
    v16 = v69;
    if (v68 <= v69)
      v17 = v69;
    else
      v17 = v68;
    v67 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v67, 1, a5->var0.var1);
    v67 = v17 * v67;
    v66 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v66, 3, a5->var0.var1);
    v65 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v65, 4, a5->var0.var1);
    v18 = v15 / v17;
    v65 = v18 * (v65 * 0.01);
    v64 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v64, 5, a5->var0.var1);
    v19 = v16 / v17;
    v64 = v19 * (v64 * 0.01);
    v63 = 0;
    objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v63, 6, a5->var0.var1);
    if (a4)
    {
      objc_msgSend(a4, "heliumRef");
      v60 = v62;
      if (v62)
        (*(void (**)(uint64_t))(*(_QWORD *)v62 + 16))(v62);
    }
    else
    {
      v62 = 0;
      v60 = 0;
    }
    -[PAESharedDefaultBase smear:fromImage:toImage:](self, "smear:fromImage:toImage:", &v60, a4, a4);
    if (v60)
      (*(void (**)(uint64_t))(*(_QWORD *)v60 + 24))(v60);
    if (v63)
    {
      v20 = (HGNode *)HGObject::operator new(0x1C0uLL);
      HGNode::HGNode(v20);
      *(_QWORD *)v20 = off_1E64E3B98;
      *((_QWORD *)v20 + 51) = 0;
      *((_QWORD *)v20 + 52) = 0;
      *((_DWORD *)v20 + 106) = 0;
      *((_QWORD *)v20 + 54) = 0;
      *((_QWORD *)v20 + 55) = 0;
      v21 = v67;
      v22 = v68;
      v23 = v64;
      v24 = v65;
      v25 = v69;
      v26 = objc_msgSend(a4, "width");
      v27 = objc_msgSend(a4, "height");
      v28 = v21;
      v29 = v22 * v24 / v18;
      *(_OWORD *)v57[0].f32 = xmmword_1B304F230;
      v55 = xmmword_1B304F240;
      v30 = v25 * v23 / v19;
      v52 = xmmword_1B304F230;
      v59 = xmmword_1B304F240;
      HEquirectGaussianBlur::init((uint64_t)v20, v26, v27, v57, (float32x2_t *)&v55, (float32x2_t *)&v52, (float32x2_t *)&v59, v28, v29, v30);
      (*(void (**)(HGNode *, _QWORD, uint64_t))(*(_QWORD *)v20 + 120))(v20, 0, v62);
      (*(void (**)(HGNode *))(*(_QWORD *)v20 + 16))(v20);
      (*(void (**)(HGNode *))(*(_QWORD *)v20 + 24))(v20);
    }
    else
    {
      v20 = (HGNode *)HGObject::operator new(0x1B0uLL);
      HGaussianBlur::HGaussianBlur((HGaussianBlur *)v20);
      v31 = v67;
      v32 = v65;
      v33 = v64;
      HGaussianBlur::init((HGaussianBlur *)v20, v31, v32, v33, v14 == 0, 0, 0);
      (*(void (**)(HGNode *, _QWORD, uint64_t))(*(_QWORD *)v20 + 120))(v20, 0, v62);
      (*(void (**)(HGNode *))(*(_QWORD *)v20 + 16))(v20);
      (*(void (**)(HGNode *))(*(_QWORD *)v20 + 24))(v20);
    }
    *(_QWORD *)&v59 = v20;
    (*(void (**)(HGNode *))(*(_QWORD *)v20 + 16))(v20);
    -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v59, a4, a3);
    v34 = (HgcUnsharpMask *)HGObject::operator new(0x1A0uLL);
    HgcUnsharpMask::HgcUnsharpMask(v34);
    v58 = v34;
    (*(void (**)(HgcUnsharpMask *, _QWORD, uint64_t))(*(_QWORD *)v34 + 120))(v34, 0, v62);
    (*(void (**)(HgcUnsharpMask *, uint64_t, _QWORD))(*(_QWORD *)v58 + 120))(v58, 1, v59);
    v35 = v70;
    (*(void (**)(HgcUnsharpMask *, _QWORD, float, float, float, float))(*(_QWORD *)v58 + 96))(v58, 0, v35, 0.0, 0.0, 0.0);
    v36 = v66;
    (*(void (**)(HgcUnsharpMask *, uint64_t, float, float, float, float))(*(_QWORD *)v58 + 96))(v58, 1, v36, 0.0, 0.0, 0.0);
    if (v14)
    {
      if (v63)
      {
        -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a3);
        -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
        v37 = objc_msgSend(a4, "width");
        v38 = *(double *)&v55;
        v39 = objc_msgSend(a4, "height");
        v40 = ceil(fabs(v38) * (double)v37);
        v41 = ceil(fabs(v56) * (double)v39);
        *(double *)&v52 = v40 * -0.5;
        *((double *)&v52 + 1) = v41 * -0.5;
        v53 = v40;
        v54 = v41;
        PCMatrix44Tmpl<double>::transformRect<double>((double *)v57, (double *)&v52, (uint64_t)&v52);
        v42 = *(double *)&v52;
        v43 = *((double *)&v52 + 1);
        v44 = *(double *)&v52 + v53;
        v45 = *((double *)&v52 + 1) + v54;
        v47 = HGRectMake4f(v46, v42, v43, v44, v45);
        v49 = v48;
        v50 = (HGCrop *)HGObject::operator new(0x1A0uLL);
        HGCrop::HGCrop(v50);
        (*(void (**)(HGCrop *, _QWORD, HgcUnsharpMask *))(*(_QWORD *)v50 + 120))(v50, 0, v58);
        (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v50 + 96))(v50, 0, (float)(int)v47, (float)SHIDWORD(v47), (float)(int)v49, (float)SHIDWORD(v49));
        if (v58 != v50)
        {
          if (v58)
            (*(void (**)(HgcUnsharpMask *))(*(_QWORD *)v58 + 24))(v58);
          v58 = v50;
          (*(void (**)(HGCrop *))(*(_QWORD *)v50 + 16))(v50);
        }
        (*(void (**)(HGCrop *))(*(_QWORD *)v50 + 24))(v50);
      }
      objc_msgSend(a3, "setHeliumRef:", &v58);
    }
    else
    {
      v51 = (HGColorClamp *)HGObject::operator new(0x1C0uLL);
      HGColorClamp::HGColorClamp(v51);
      (*(void (**)(HGColorClamp *, _QWORD, HgcUnsharpMask *))(*(_QWORD *)v51 + 120))(v51, 0, v58);
      v57[0] = (float32x2_t)v51;
      (*(void (**)(HGColorClamp *))(*(_QWORD *)v51 + 16))(v51);
      objc_msgSend(a3, "setHeliumRef:", v57);
      if (v57[0])
        (*(void (**)(_QWORD))(**(_QWORD **)v57 + 24))(*(_QWORD *)v57);
      (*(void (**)(HGColorClamp *))(*(_QWORD *)v51 + 24))(v51);
    }
    if (v58)
      (*(void (**)(HgcUnsharpMask *))(*(_QWORD *)v58 + 24))(v58);
    if ((_QWORD)v59)
      (*(void (**)(_QWORD))(*(_QWORD *)v59 + 24))(v59);
    (*(void (**)(HGNode *))(*(_QWORD *)v20 + 24))(v20);
    if (v61)
      (*(void (**)(uint64_t))(*(_QWORD *)v61 + 24))(v61);
    if (v62)
      (*(void (**)(uint64_t))(*(_QWORD *)v62 + 24))(v62);
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
