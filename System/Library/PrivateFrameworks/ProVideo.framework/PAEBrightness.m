@implementation PAEBrightness

- (PAEBrightness)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEBrightness;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  if (-[PAEBrightness properties]::once != -1)
    dispatch_once(&-[PAEBrightness properties]::once, &__block_literal_global_40);
  return (id)-[PAEBrightness properties]::sPropertiesDict;
}

uint64_t __27__PAEBrightness_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 67584);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 591872);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, CFSTR("PixelTransformSupport"), v2, CFSTR("PixelIndependent"), v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("SDRWorkingSpace"), v8, CFSTR("HDRWorkingSpace"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1),
             CFSTR("AutoColorProcessingSupport"),
             0);
  -[PAEBrightness properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PAEBrightness;
  -[PAESharedDefaultBase addParameters](&v5, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Brightness::Brightness"), 0, 0), 1, 0, 1.0, 0.0, 1000.0, 0.0, 5.0, 0.1);
  return v3 != 0;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  int v10;
  uint64_t v11;
  BOOL v12;
  BOOL v13;
  HGColorMatrix *v14;
  float v15;
  float v16;
  float v17;
  HGColorMatrix *v19;
  uint64_t v20;
  double v21;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (!v9)
    return 0;
  v21 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v21, 1, a5->var0.var1);
  v10 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  v11 = objc_msgSend(a4, "imageType");
  if (v10)
    v12 = v11 == 3;
  else
    v12 = 0;
  v13 = v12;
  if (v12)
  {
    if (a4)
      objc_msgSend(a4, "heliumRef");
    else
      v20 = 0;
    v14 = (HGColorMatrix *)HGObject::operator new(0x1F0uLL);
    HGColorMatrix::HGColorMatrix(v14);
    v19 = v14;
    v15 = v21;
    (*(void (**)(HGColorMatrix *, _QWORD, float, float, float, float))(*(_QWORD *)v14 + 96))(v14, 0, v15, 0.0, 0.0, 0.0);
    v16 = v21;
    (*(void (**)(HGColorMatrix *, uint64_t, float, float, float, float))(*(_QWORD *)v14 + 96))(v14, 1, 0.0, v16, 0.0, 0.0);
    v17 = v21;
    (*(void (**)(HGColorMatrix *, uint64_t, float, float, float, float))(*(_QWORD *)v14 + 96))(v14, 2, 0.0, 0.0, v17, 0.0);
    (*(void (**)(HGColorMatrix *, uint64_t, float, float, float, float))(*(_QWORD *)v14 + 96))(v14, 3, 0.0, 0.0, 0.0, 1.0);
    (*(void (**)(HGColorMatrix *, _QWORD, uint64_t))(*(_QWORD *)v14 + 120))(v14, 0, v20);
    objc_msgSend(a3, "setHeliumRef:", &v19);
    if (v19)
      (*(void (**)(HGColorMatrix *))(*(_QWORD *)v19 + 24))(v19);
    if (v20)
      (*(void (**)(uint64_t))(*(_QWORD *)v20 + 24))(v20);
  }
  return v13;
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
