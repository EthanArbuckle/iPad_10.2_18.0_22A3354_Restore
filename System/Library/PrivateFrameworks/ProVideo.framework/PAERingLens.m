@implementation PAERingLens

- (PAERingLens)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAERingLens;
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
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("InputSizeLimit"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
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
  if ((objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v14, 2, a3.var1) & 1) != 0
    && (v13 = 0, (objc_msgSend(v7, "getBoolValue:fromParm:atFxTime:", &v13, 5, a3.var1) & 1) != 0))
  {
    if (v14 == 0.0 && v13 == 0)
      v9 = 6;
    else
      v9 = 1;
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
  BOOL v5;
  BOOL v6;
  unsigned int v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PAERingLens;
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
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RingLens::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RingLens::Radius"), 0, 0), 2, 0, 160.0, 0.0, dbl_1B30506D0[v7 < 2], 0.0, dbl_1B304FBB0[v7 < 2], 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RingLens::Thickness"), 0, 0), 3, 0, 0.43, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RingLens::Refraction"), 0, 0), 4, 0, 1.7, -5.0, 5.0, -5.0, 5.0, 0.5);
    if (v7)
      objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RingLens::Crop"), 0, 0), 5, 0, 33);
  }
  return v6;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  float64x2_t v18;
  double v19;
  double v20;
  double v21;
  HRingLens *v22;
  float v23;
  double v24;
  float v25;
  float v26;
  float v27;
  unint64_t v28;
  unint64_t v29;
  float v30;
  float v31;
  HGOverwrite *v32;
  char v34;
  HGOverwrite *v35;
  uint64_t v36;
  double v37;
  __int128 v38;
  double v39[3];
  float64x2_t v40[8];
  double v41[16];
  double v42;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = v9;
  if (v9)
  {
    v42 = 160.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v42, 2, a5->var0.var1);
    if (v42 == 0.0)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef", v42);
      else
        v41[0] = 0.0;
      objc_msgSend(a3, "setHeliumRef:", v41);
      if (*(_QWORD *)&v41[0])
        (*(void (**)(_QWORD))(**(_QWORD **)&v41[0] + 24))(*(_QWORD *)&v41[0]);
    }
    else
    {
      v11 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190, v42);
      if (v11)
        v12 = objc_msgSend(v11, "versionAtCreation") == 0;
      else
        v12 = 0;
      -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
      -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
      __asm { FMOV            V0.2D, #0.5 }
      *(_OWORD *)v39 = _Q0;
      objc_msgSend(v10, "getXValue:YValue:fromParm:atFxTime:", v39, &v39[1], 1, a5->var0.var1);
      -[PAESharedDefaultBase convertRelativeToImageCoordinates:withImage:](self, "convertRelativeToImageCoordinates:withImage:", v39, a4);
      *(_OWORD *)v39 = v38;
      PCMatrix44Tmpl<double>::rightTranslate(v41, *(double *)&v38, *((double *)&v38 + 1), 0.0);
      v18.f64[0] = -v39[0];
      *(_QWORD *)&v19 = *(_OWORD *)&PCMatrix44Tmpl<double>::leftTranslate(v40, v18, -v39[1], 0.0);
      *(_QWORD *)&v38 = 0x3FDB851EB851EB85;
      objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v38, 3, a5->var0.var1, v19);
      v37 = 1.7;
      objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v37, 4, a5->var0.var1);
      v20 = v42;
      v21 = *(double *)&v38;
      if (-[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1)
        && objc_msgSend(a4, "imageType") == 3)
      {
        if (a4)
          objc_msgSend(a4, "heliumRef");
        else
          v36 = 0;
        v22 = (HRingLens *)HGObject::operator new(0x2B0uLL);
        HRingLens::HRingLens(v22);
        (*(void (**)(HRingLens *, _QWORD, uint64_t))(*(_QWORD *)v22 + 120))(v22, 0, v36);
        (*(void (**)(HRingLens *, uint64_t, uint64_t))(*(_QWORD *)v22 + 120))(v22, 1, v36);
        v23 = v20 * (1.0 - v21);
        v24 = v20 - v23;
        v25 = 1.0 / v24;
        *(float *)&v24 = (float)-v23 / v24;
        (*(void (**)(HRingLens *, _QWORD, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 0, v25, *(float *)&v24, 1.4623, -0.73113);
        v26 = v37 * v42;
        (*(void (**)(HRingLens *, uint64_t, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 1, 0.31831, 0.5, v26, 0.0);
        v27 = v42;
        HRingLens::SetRadius(v22, v27, v23);
        v28 = objc_msgSend(a4, "width");
        v29 = objc_msgSend(a4, "height");
        v30 = (double)v28 * 0.5;
        v31 = (double)v29 * 0.5;
        (*(void (**)(HRingLens *, uint64_t, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 3, v30, v31, 0.0, 0.0);
        HRingLens::SetOutputToImage((double *)v22, v40[0].f64);
        HRingLens::SetImageToInput((double *)v22, v41);
        v32 = (HGOverwrite *)HGObject::operator new(0x1A0uLL);
        HGOverwrite::HGOverwrite(v32);
        (*(void (**)(HGOverwrite *, _QWORD, uint64_t))(*(_QWORD *)v32 + 120))(v32, 0, v36);
        (*(void (**)(HGOverwrite *, uint64_t, HRingLens *))(*(_QWORD *)v32 + 120))(v32, 1, v22);
        v35 = v32;
        (*(void (**)(HGOverwrite *))(*(_QWORD *)v32 + 16))(v32);
        v34 = 1;
        if (v12 || (objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v34, 5, a5->var0.var1), v34))
          -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v35, a4, a3);
        objc_msgSend(a3, "setHeliumRef:", &v35);
        if (v35)
          (*(void (**)(HGOverwrite *))(*(_QWORD *)v35 + 24))(v35);
        (*(void (**)(HGOverwrite *))(*(_QWORD *)v32 + 24))(v32);
        (*(void (**)(HRingLens *))(*(_QWORD *)v22 + 24))(v22);
        if (v36)
          (*(void (**)(uint64_t))(*(_QWORD *)v36 + 24))(v36);
      }
    }
  }
  return v10 != 0;
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
