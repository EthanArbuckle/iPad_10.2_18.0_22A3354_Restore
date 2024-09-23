@implementation PAEFisheye

- (PAEFisheye)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEFisheye;
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

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  uint64_t v6;
  id result;
  objc_class *v8;
  id v9;
  double v10;

  v10 = 0.0;
  if ((objc_msgSend(-[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4), "getFloatValue:fromParm:atFxTime:", &v10, 2, a3.var1) & 1) != 0)
  {
    if (v10 == 0.0)
      v6 = 6;
    else
      v6 = 3;
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6, v10), CFSTR("PixelTransformSupport"), 0);
  }
  else if (a4)
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = -[PAEFilterDefaultBase getParamErrorFor:](self, "getParamErrorFor:", NSStringFromClass(v8));
    result = 0;
    *a4 = v9;
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
  v6.super_class = (Class)PAEFisheye;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Fisheye::Radius"), 0, 0), 1, 0, 1.0, 0.0, 2.0, 0.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Fisheye::Amount"), 0, 0), 2, 0, 15.0, -100.0, 100.0, -100.0, 100.0, 1.0);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Fisheye::Center"), 0, 0), 3, 0, 0.5, 0.5);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  int v14;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  HgcFisheye *v27;
  float v28;
  float v29;
  float v30;
  float v31;
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
  HgcFisheye *v50;
  HGNode *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  __int128 v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  uint64_t v67;
  __int128 v68;
  double v69;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (!v9)
    goto LABEL_21;
  v11 = (void *)v10;
  v69 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v69, 2, a5->var0.var1);
  if (v69 == 0.0)
  {
    if (a4)
      objc_msgSend(a4, "heliumRef", v69);
    else
      *(_QWORD *)&v60 = 0;
    objc_msgSend(a3, "setHeliumRef:", &v60);
    if ((_QWORD)v60)
      (*(void (**)(_QWORD))(*(_QWORD *)v60 + 24))(v60);
LABEL_12:
    LOBYTE(v14) = 1;
    return v14;
  }
  v12 = v69 / 30.0 + 1.0;
  if (v69 <= 0.0)
    v12 = 1.0 / (1.0 - v69 / 30.0);
  v69 = v12;
  if (v11)
    v13 = (double)objc_msgSend(v11, "versionAtCreation");
  else
    v13 = 0.0;
  __asm { FMOV            V0.2D, #0.5 }
  v68 = _Q0;
  objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v68, (char *)&v68 + 8, 3, a5->var0.var1);
  -[PAESharedDefaultBase convertRelativeToImageCoordinates:withImage:](self, "convertRelativeToImageCoordinates:withImage:", &v68, a4);
  v68 = v60;
  v67 = 0x3FB999999999999ALL;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v67, 1, a5->var0.var1);
  v20 = *(double *)&v67;
  v21 = v20 * (double)(unint64_t)objc_msgSend(a4, "width");
  v22 = *(double *)&v67;
  v23 = objc_msgSend(a4, "height");
  v24 = fmax(v21, 1.0);
  if (v13 == 0.0)
  {
    objc_msgSend(a4, "pixelAspect");
    v26 = v24 * (1.0 / v25);
  }
  else
  {
    v26 = fmax(v22 * (double)v23, 1.0);
  }
  -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
  -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a4);
  v14 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  if (v14)
  {
    if (objc_msgSend(a3, "imageType") == 3)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef");
      else
        v51 = 0;
      v27 = (HgcFisheye *)HGObject::operator new(0x220uLL);
      HgcFisheye::HgcFisheye(v27);
      *(_QWORD *)v27 = &unk_1E64DD308;
      HGNode::SetInput((HGNode *)v27, 0, v51);
      v28 = *(double *)&v60;
      v29 = *((double *)&v60 + 1);
      v30 = v61;
      v31 = v62;
      (*(void (**)(HgcFisheye *, _QWORD, float, float, float, float))(*(_QWORD *)v27 + 96))(v27, 0, v28, v29, v30, v31);
      v32 = v63;
      v33 = v64;
      v34 = v65;
      v35 = v66;
      (*(void (**)(HgcFisheye *, uint64_t, float, float, float, float))(*(_QWORD *)v27 + 96))(v27, 1, v32, v33, v34, v35);
      v36 = v52;
      v37 = v53;
      v38 = v54;
      v39 = v55;
      (*(void (**)(HgcFisheye *, uint64_t, float, float, float, float))(*(_QWORD *)v27 + 96))(v27, 2, v36, v37, v38, v39);
      v40 = v56;
      v41 = v57;
      v42 = v58;
      v43 = v59;
      (*(void (**)(HgcFisheye *, uint64_t, float, float, float, float))(*(_QWORD *)v27 + 96))(v27, 3, v40, v41, v42, v43);
      v44 = v69;
      (*(void (**)(HgcFisheye *, uint64_t, float, float, float, float))(*(_QWORD *)v27 + 96))(v27, 4, v44, 0.0, 0.0, 0.0);
      v45 = 1.0 / (v24 / a5->var3 * (v24 / a5->var3));
      v46 = 1.0 / (v26 / a5->var4 * (v26 / a5->var4));
      (*(void (**)(HgcFisheye *, uint64_t, float, float, float, float))(*(_QWORD *)v27 + 96))(v27, 5, v45, v46, 0.0, 0.0);
      v47 = *(double *)&v68;
      v48 = *((double *)&v68 + 1);
      (*(void (**)(HgcFisheye *, uint64_t, float, float, float, float))(*(_QWORD *)v27 + 96))(v27, 6, v47, v48, 0.0, 0.0);
      v50 = v27;
      (*(void (**)(HgcFisheye *))(*(_QWORD *)v27 + 16))(v27);
      -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v50, a4, a3);
      objc_msgSend(a3, "setHeliumRef:", &v50);
      if (v50)
        (*(void (**)(HgcFisheye *))(*(_QWORD *)v50 + 24))(v50);
      (*(void (**)(HgcFisheye *))(*(_QWORD *)v27 + 24))(v27);
      if (v51)
        (*(void (**)(HGNode *))(*(_QWORD *)v51 + 24))(v51);
      goto LABEL_12;
    }
LABEL_21:
    LOBYTE(v14) = 0;
  }
  return v14;
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
