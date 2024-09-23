@implementation PAESphere

- (PAESphere)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAESphere;
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
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("SupportsHeliumRendering"), v5, CFSTR("MayRemapTime"), v6, CFSTR("SupportsLargeRenderScale"), v7, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PAESphere;
  -[PAESharedDefaultBase addParameters](&v10, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (!v4)
    return 0;
  v5 = objc_msgSend(v4, "versionAtCreation");
  if (!v3)
    return 0;
  v6 = v5;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = 1;
  objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Sphere::Center"), 0, 0), 1, 0, 0.5, 0.5);
  objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Sphere::Radius"), 0, 0), 2, 0, 400.0, 0.0, 1000.0, 0.0, 1000.0, 1.0);
  if (v6)
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Sphere::Crop"), 0, 0), 3, 0, 33);
  return v8;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  BOOL v11;
  float64x2_t v17;
  double v18;
  HGNode *v19;
  HSphere *v20;
  float v21;
  HSphere *v23;
  char v24;
  HGNode *v25;
  __int128 v26;
  __int128 v27;
  float64x2_t v28[8];
  double v29[16];

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v10)
  {
    v11 = objc_msgSend(v10, "versionAtCreation") == 0;
    if (!v9)
      return v9 != 0;
  }
  else
  {
    v11 = 0;
    if (!v9)
      return v9 != 0;
  }
  -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
  -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
  __asm { FMOV            V0.2D, #0.5 }
  v27 = _Q0;
  objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v27, (char *)&v27 + 8, 1, a5->var0.var1);
  -[PAESharedDefaultBase convertRelativeToImageCoordinates:withImage:](self, "convertRelativeToImageCoordinates:withImage:", &v27, a4);
  v27 = v26;
  PCMatrix44Tmpl<double>::rightTranslate(v29, *(double *)&v26, *((double *)&v26 + 1), 0.0);
  v17.f64[0] = -*(double *)&v27;
  *(_QWORD *)&v18 = *(_OWORD *)&PCMatrix44Tmpl<double>::leftTranslate(v28, v17, -*((double *)&v27 + 1), 0.0);
  *(_QWORD *)&v26 = 0x4079000000000000;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v26, 2, a5->var0.var1, v18);
  if (*(double *)&v26 == 0.0)
  {
    v19 = (HGNode *)HGObject::operator new(0x1A0uLL);
    HGNode::HGNode(v19);
    v25 = v19;
    objc_msgSend(a3, "setHeliumRef:", &v25);
    if (v25)
      (*(void (**)(HGNode *))(*(_QWORD *)v25 + 24))(v25);
  }
  else
  {
    if (a4)
      objc_msgSend(a4, "heliumRef", *(double *)&v26);
    else
      v25 = 0;
    v20 = (HSphere *)HGObject::operator new(0x2B0uLL);
    HSphere::HSphere(v20);
    (*(void (**)(HSphere *, _QWORD, HGNode *))(*(_QWORD *)v20 + 120))(v20, 0, v25);
    v21 = *(double *)&v26;
    HSphere::SetRadius(v20, v21);
    HSphere::SetOutputToImage((double *)v20, v28[0].f64);
    HSphere::SetImageToInput((double *)v20, v29);
    v24 = 1;
    if (!v11)
      objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v24, 3, a5->var0.var1);
    v23 = v20;
    (*(void (**)(HSphere *))(*(_QWORD *)v20 + 16))(v20);
    if (v24)
      -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v23, a4, a3);
    objc_msgSend(a3, "setHeliumRef:", &v23);
    if (v23)
      (*(void (**)(HSphere *))(*(_QWORD *)v23 + 24))(v23);
    (*(void (**)(HSphere *))(*(_QWORD *)v20 + 24))(v20);
    if (v25)
      (*(void (**)(HGNode *))(*(_QWORD *)v25 + 24))(v25);
  }
  return v9 != 0;
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
