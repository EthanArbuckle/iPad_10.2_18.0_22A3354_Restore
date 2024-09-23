@implementation PAEGamma

- (PAEGamma)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEGamma;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  if (-[PAEGamma properties]::once != -1)
    dispatch_once(&-[PAEGamma properties]::once, &__block_literal_global_38);
  return (id)-[PAEGamma properties]::sPropertiesDict;
}

uint64_t __22__PAEGamma_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", &unk_1E6649180, CFSTR("PixelTransformSupport"), v1, CFSTR("PixelIndependent"), v2, CFSTR("PositionIndependent"), v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsLargeRenderScale"), v5, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
  -[PAEGamma properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PAEGamma;
  -[PAESharedDefaultBase addParameters](&v5, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Gamma::Gamma"), 0, 0), 1, 0, 1.0, 0.0, 10.0, 0.0, 5.0, 0.1);
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  double v10;
  HGGamma *v11;
  float v12;
  HGGamma *v14;
  uint64_t v15;
  double v16;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    v16 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v16, 1, a5->var0.var1);
    v10 = 16.6666667;
    if (v16 >= 0.06)
      v10 = 1.0 / v16;
    v16 = v10;
    LODWORD(v9) = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
    if ((_DWORD)v9)
    {
      if (objc_msgSend(a4, "imageType") == 3)
      {
        if (a4)
          objc_msgSend(a4, "heliumRef");
        else
          v15 = 0;
        v11 = (HGGamma *)HGObject::operator new(0x1B0uLL);
        HGGamma::HGGamma(v11);
        v12 = v16;
        (*(void (**)(HGGamma *, _QWORD, float, float, float, float))(*(_QWORD *)v11 + 96))(v11, 0, v12, v12, v12, 1.0);
        (*(void (**)(HGGamma *, _QWORD, uint64_t))(*(_QWORD *)v11 + 120))(v11, 0, v15);
        v14 = v11;
        (*(void (**)(HGGamma *))(*(_QWORD *)v11 + 16))(v11);
        objc_msgSend(a3, "setHeliumRef:", &v14);
        if (v14)
          (*(void (**)(HGGamma *))(*(_QWORD *)v14 + 24))(v14);
        (*(void (**)(HGGamma *))(*(_QWORD *)v11 + 24))(v11);
        if (v15)
          (*(void (**)(uint64_t))(*(_QWORD *)v15 + 24))(v15);
        LOBYTE(v9) = 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
  }
  return (char)v9;
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
